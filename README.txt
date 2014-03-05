
Node utility helper functions use with Marmalade Quick
(C) Nick Smith 2013-2014

Provides helper functions to make dealing with Quick's Node objects easier.

Includes:
- cancel all timers for a node
- cancel all tweens for a node
- pause all tweens and timers in a tree of nodes
- resume all tweens and timers in a tree of nodes
- "destroy" a node - cancel timers and tweens and remove from parent in scene
- "destroy" a tree of nodes recursively


You need a Marmalade license and Marmalade SDK 7.0 or newer to use this code
    www.madewithmarmalade.com

--------
Fuctions
--------

function cancelTimersOnNode(node)
function cancelTweensOnNode(node)
function pauseNodesInTree(node)
function resumeNodesInTree(node)

function destroyNode(target)
   Use this function to remove Quick nodes from the current scene
   Can pass it to tween:to/from as the onComplete callback (onComplete is
   automatically passed the owning node as a param)
   Still need to manually nil any explicit handle we have afterwards
   Often the nodes have no handle in a game, e.g. ones that were only ever
   handled with local vars
   Also cancels all timers and tweens as these would keep running until node
   is garbage collected.

function destroyNodesInTree(node, destroyRoot)
   Recursively kill tree of nodes. Top level node is optional
   Will not nil any values pointing to the nodes, but useful for clenaing up
   dynamically created nodes that only get tracked via the scene graph.


Provided under the MIT license:

/*
 * (C) 2013-2014 Nick Smith.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

Hack away and re-use code for your own projects :)
