/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function named **shortestDistance** that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 The function header should look like this:
 
  ![example](example1.png "example")
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a new **Line** structure.
 
 Recall that a line is defined by it's *slope* and it's *vertical intercept*. What stored properties would you create for a **Line** structure?
 
 Recall that slope, in turn, is defined by it's *rise* and *run*. Could you create a **Slope** structure? What stored properties might it define?
 
 Recall that the shortest distance from a point to a line is the *perpendicular* distance from that point to the line.
 
 Here is a [complete example showing how to find the shortest distance from a point to a line](http://russellgordon.ca/lcs/shortest-distance-example.pdf), using symbolic algebra.
 
 Your job is to implement a solution in code that carries out the necessary mathematics. The beautiful part of this effort is that, once you've "taught" the computer how to do this correctly, you will never need to do this type of work manually again. 👍🏽😅🎉

*/

// Our given line is : y = -1/2 + 9.5
// Our given point is : (6 , 1.5)

// Define the structure representing a point on a Carteisian plane
struct Point {
    var x : Double = 0.0
    var y : Double = 0.0

}

// Create an instance of the point from our problem
var Cabinsite = Point(x: 6.0, y: 1.5)

// define a structure that represents a Line
struct Line {
    var slope : Double = 1.0
    var verticalIntercept : Double = 0.0
    
}

// Create an instance of the line from our problem
var existingRoad : Line ( slope: -0.5, verticalIntercept: 9.5)

