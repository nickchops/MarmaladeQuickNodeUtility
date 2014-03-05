
-- Utility functions for working with Marmalade Quick Node objects
-- (C) Nick Smith 2014


function cancelTimersOnNode(node)
    for k,v in pairs(node.timers) do
        v:cancel()
    end
end
function cancelTweensOnNode(node)
    for k,v in pairs(node.tweens) do
        tween:cancel(v)
    end
end

-- Use this function to remove Quick nodes from the current scene
-- Can pass it to tween:to/from as the onComplete callback (onComplete is
-- automatically passed the owning node as a param)
-- Still need to manually nil any explicit handle we have afterwards
-- Often the nodes have no handle in a game, e.g. ones that were only ever
-- handled with local vars
-- Also cancels all timers and tweens as these would keep running until node
-- is garbage collected.
function destroyNode(node)
    cancelTimersOnNode(node)
    cancelTweensOnNode(node)
    node:removeFromParent() --also sets parent's reference to this node to nil
end

-- Quick has no "director:pauseAllNodeTimers()" or equivalent for tweens - 
-- Use this to recursively find all children and pause them
function pauseNodesInTree(node)
    node:pauseTimers()
    node:pauseTweens()
    for k,child in pairs(node.children) do
        pauseNodesInTree(child)
    end
end

function resumeNodesInTree(node)
    node:resumeTimers()
    node:resumeTweens()
    for k,child in pairs(node.children) do
        resumeNodesInTree(child)
    end
end

-- Recursively kill tree of nodes. Top level node is optional
-- Will not nil any values pointing to the nodes, but useful for clenaing up
-- dynamically created nodes that only get tracked via the scene graph.
function destroyNodesInTree(node, destroyRoot)
    for k,child in pairs(node.children) do
        destroyNodesInTree(child, true)
    end
    if destroyRoot then
        destroyNode(node)
    end
end
