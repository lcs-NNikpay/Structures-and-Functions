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

// Define a structure that represents slope
struct Slope {
    var rise : Double = 1.0
    var run : Double = 1.0
}

// define a structure that represents a Line
struct Line {
    var slope : Slope = Slope(rise: 1.0, run: 1.0 )
    var verticalIntercept : Double = 0.0
    
}

///  Returns the slope of line perpendicular to the provided line
///
/// - Parameter givenLine: The line that we are starting from
/// - Returns: The slope of the line that is perpendicular
func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {
  
    return Slope(rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
}

func getverticalIntercept( from p : Point, onLinewith m : Slope) -> Double {
    
    // get the slope as a decimal
    let mAsdecimal = m.rise / m.run
    
    // b = y - m * x
    return p.y - mAsdecimal * p.x
}

/// Gets the point where two lines in a Cartesian plane intersect
///
/// - Parameters:
///   - first: the first line
///   - second: the second line
/// - Returns: the point of itersection
func getpointOfInterception(between first : Line, and second : Line ) -> Point {
    
    // Reminder : x = (b1 - b2) / (m2 - m1)
    
    // Get the vertical intercept  difference
    let verticalInterceptDifference = first.verticalIntercept - second.verticalIntercept
    
    // Get the slope difference
    let slopeDifference = second.slope.rise / second.slope.run - first.slope.rise / first.slope.run
    
    // Get the actual x-value (abscissa)
    let x = verticalInterceptDifference / slopeDifference
    
    // Get the actual y-value (subtitution) (ordinate)
    // y = m1 * x + b1
    let y = first.slope.rise / first.slope.run * x + first.verticalIntercept
    
    // Return the point of intersection
    
    return Point(x: x, y: y)
}

///  Finds the distance between two points
///
/// - Parameters:
///   - from: the first point
///   - to: the second point
/// - Returns: the distance
func distance(from: Point, to: Point) -> Double {
    // Return the distance (from Pythagorean's Theorem)
    return sqrt( pow(from.x - to.x, 2) + pow(to.y - from.y, 2)  )
    
}

/// Finds the shortest distance from a given point to a given line. (This is the distance formed from a perpendicular line segment.)
///
/// - Parameters:
///   - providedPoint: a point on a Cartesian plane
///   - providedLine: a line
/// - Returns: the shortest distance
func shortestDistance(from providedPoint: Point, to providedLine : Line ) -> Double {
    
    // Get the perpendicular slope (the slope of new road from the cabin to existing road)
    let perpendicularSlope = getSlopeOfPerpendicularLine(from: providedLine)
    
    // Get the vertical intercept of the new road
    let perpendicularLineVerticalIntercept = getverticalIntercept(from: providedPoint, onLinewith: perpendicularSlope)
   
    // Define the equation of the new line (the new road that needs to be built)
    let newLine = Line(slope: perpendicularSlope, verticalIntercept: perpendicularLineVerticalIntercept)
    
    // Invoke the function to get the point of intersection
    let pointOfIntersection = getpointOfInterception(between: providedLine, and: newLine)
    
    // Now actually find the shortest distance
    let shortestDistance = distance(from: providedPoint, to: pointOfIntersection)
    
    // Give back the shortest distance
    return shortestDistance
    
}

// Create an instance of the point from our problem
var cabinSite = Point(x: 6, y: 1.5)

// Create an instance of the line from our problem
var slopeOfExistingRoad = Slope(rise: -1, run: 2)
var existingRoad = Line(slope: slopeOfExistingRoad, verticalIntercept: 9.5)

// Use the overall function
shortestDistance(from: cabinSite, to: existingRoad)

