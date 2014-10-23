object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val primes = (2 until l.toInt).filter(x => isPrime(x)).mkString(",")
    println(primes)
  }
  def isPrime(n: Int): Boolean = (2 until n) forall( n % _ != 0)
}
