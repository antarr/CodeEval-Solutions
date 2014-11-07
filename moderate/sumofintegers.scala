import scala.annotation.tailrec
object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val numbers = l.split(',').map(_.trim.toInt).toList
    val largest = largestSum(numbers)
    println(largest)
  }
  
  def largestSum(ns: List[Int]): Int ={
    def sum(numbers: List[Int]) = numbers.foldLeft(0)((a,b) => a+ b)

    @tailrec def loop(numbers: List[Int], large: Int): Int = numbers match{
      case Nil => large
      case _ => {
        val thisSum = sum(numbers)
        if(thisSum > large)
          loop(numbers.tail, thisSum)
        else
          loop(numbers.tail,large)
      }
    }
    
    (for{
          i <- 1 to ns.length
    			window <- ns.sliding(i)
    } yield loop(window.tail, sum(window))).max
     
  }
}
