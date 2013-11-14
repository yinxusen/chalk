package chalk.util;

/**
 * Created with IntelliJ IDEA.
 * User: sen
 * Date: 11/14/13
 * Time: 11:31 AM
 * To change this template use File | Settings | File Templates.
 */
import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.util.Version;

import java.util.ArrayList;

public class tokenizer {
    public static ArrayList<String> parseString(Analyzer analyzer, String string) throws IOException {

        ArrayList<String> result = new ArrayList<String>();

        TokenStream tokenStream = analyzer.tokenStream(null, new StringReader(string));
        CharTermAttribute charTermAttribute = tokenStream.addAttribute(CharTermAttribute.class);

        tokenStream.reset();
        while (tokenStream.incrementToken()) {
            result.add(charTermAttribute.toString());
        }

        tokenStream.end();
        tokenStream.close();

        return result;
    }

    public static ArrayList<String> parseString(String s) throws IOException {
        return tokenizer.parseString(new SmartChineseAnalyzer(Version.LUCENE_45), s);
    }
}
