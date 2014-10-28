import scala.util.matching.Regex
object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  val pattern = """\(\)|\[\]|\{\}""".r
  for (l <- lines) {
    balance(l) match{
      case true => println("True")
      case false => println("False")
    }

  }
  def balance(str: String): Boolean = {
    if(str.isEmpty)
      true
    else if((pattern findFirstIn str) == None)
      false
    else
      balance(pattern replaceAllIn (str,"") )}
}
