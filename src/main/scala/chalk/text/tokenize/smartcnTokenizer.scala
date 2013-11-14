package chalk.text.tokenize

/**
 * Created with IntelliJ IDEA.
 * User: sen
 * Date: 11/14/13
 * Time: 11:55 AM
 * To change this template use File | Settings | File Templates.
 */
import chalk.util.tokenizer
import scala.collection.JavaConversions._

class smartcnTokenizer {
  def apply(s: String): Iterable[String] = tokenizer.parseString(s)
}

object smartcnTokenizer extends smartcnTokenizer
