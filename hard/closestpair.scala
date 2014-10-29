package play
import Math.{sqrt, pow}
import scala.annotation.tailrec

object closestpairs {
  case class Point(x: Double, y: Double)
  {

    def distance(other: Point): Double =
      sqrt(pow(x - other.x, 2) + pow(y - other.y, 2))

    def closest(others: List[Point]): Point = {
      @tailrec
      def helper(other: Point, others: List[Point], shortest: Double): Point ={
        if(others.isEmpty)
          other
        else if(shortest > distance(others.head))
          helper(others.head,others.tail,distance(others.head))
        else
          helper(other,others.tail,shortest)
      }
    helper(others.head,others.tail,distance(others.head))
    }

    def distanceToClosest(others: List[Point]): Double = distance(closest(others))
  }

  def shortestDistance(points: List[Point]): Double =
    (for(point <- points) yield point.distanceToClosest(points.filter(e => e.distance(point) != 0))).min
                                                  //> shortestDistance: (points: List[play.closestpairs.Point])Double
  val lines = List("5","0 2","6 67","43 71","39 107","189 140", "0")
                                                  //> lines  : List[String] = List(5, 0 2, 6 67, 43 71, 39 107, 189 140, 0)
  val points = lines.filter(_.contains(" ")).map(l => Point(l.split(" ")(0).toDouble,l.split(" ")(1).toDouble))
                                                  //> points  : List[play.closestpairs.Point] = List(Point(0.0,2.0), Point(6.0,67
                                                  //| .0), Point(43.0,71.0), Point(39.0,107.0), Point(189.0,140.0))
  val short =shortestDistance(points)             //> short  : Double = 36.22154055254967
  println(f"$short%1.4f")                         //> 36.2215
}
