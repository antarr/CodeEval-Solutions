package play
import Math.{sqrt, pow}

object closestpairs {
  case class Point(x: Double, y: Double) {
  def distance(other: Point): Double =
    sqrt(pow(x - other.x, 2) + pow(y - other.y, 2))

  def closest(others: List[Point]): Point = {
    def helper(other: Point, others: List[Point]): Point ={
      if(others.isEmpty)
        other
      else if(distance(other) > distance(others.head))
        helper(others.head,others.tail)
      else
        helper(other,others.tail)
    }

    helper(others.head,others.tail)
  }

  def distanceToClosest(others: List[Point]): Double = distance(closest(others))
}

  val p1 = Point(0, 2)                            //> p1  : play.closestpairs.Point = Point(0.0,2.0)
  val p2 = Point(6, 67)                           //> p2  : play.closestpairs.Point = Point(6.0,67.0)
  val p3 = Point(43, 71)                          //> p3  : play.closestpairs.Point = Point(43.0,71.0)
  val p4 = Point(39, 107)                         //> p4  : play.closestpairs.Point = Point(39.0,107.0)
  val p5 = Point(189, 140)                        //> p5  : play.closestpairs.Point = Point(189.0,140.0)

  val points = List(p1,p2,p3,p4,p5)               //> points  : List[play.closestpairs.Point] = List(Point(0.0,2.0), Point(6.0,67.
                                                  //| 0), Point(43.0,71.0), Point(39.0,107.0), Point(189.0,140.0))

  p1 closest points                               //> res0: play.closestpairs.Point = Point(0.0,2.0)

  def shortestDistance(points: List[Point]): Double ={
    val short = (for(point <- points) yield point.distanceToClosest(points.filter(e => e.distance(point) != 0))).min
    short - (short % 0.0001)
  }                                               //> shortestDistance: (points: List[play.closestpairs.Point])Double

  def addPoint(line: String, points: List[Point]): List[Point] ={
    val positions = line.split(" ") map (e=> e.toDouble)
    Point(positions(0), positions(1)) :: points
  }                                               //> addPoint: (line: String, points: List[play.closestpairs.Point])List[play.cl
                                                  //| osestpairs.Point]

  addPoint("99 3", points)                        //> res1: List[play.closestpairs.Point] = List(Point(99.0,3.0), Point(0.0,2.0),
                                                  //|  Point(6.0,67.0), Point(43.0,71.0), Point(39.0,107.0), Point(189.0,140.0))
                                                  //|
  shortestDistance(points)                        //> res2: Double = 36.2215
}
