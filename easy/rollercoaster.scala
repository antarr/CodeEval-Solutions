 object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {

  def rollerCoasterText(str: String)   ={
    def upper(str: String)  {
      if(str.tail.isEmpty){
        println(str.head)
        return
      }
      if(str.head.toString.matches("[a-zA-Z]")){
        print(Character.toUpperCase(str.head))
        lower(str.tail) }
      else{
        print(str.head)
			  upper(str.tail)}
			}

  def lower(str: String) {
    if(str.tail.isEmpty){
      println(str.head)
      return
    }
    if(str.head.toString.matches("[a-zA-Z]")){
        print(Character.toLowerCase(str.head))
        upper(str.tail)}
      else{
        print(str.head)
			  lower(str.tail)}
      }
      upper(str)}
   rollerCoasterText(l)
   }
}
