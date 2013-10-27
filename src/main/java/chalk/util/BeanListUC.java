package chalk.util;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class BeanListUC {
    Connection conn = null;
    String url = null;
    String jdbcDriver = null;
    String user = null;
    String passwd = null;

    public BeanListUC(String url, String jdbcDriver, String user, String passwd) {
        this.url = url;
        this.jdbcDriver = jdbcDriver;
        this.user = user;
        this.passwd = passwd;
    }

    public Map<String, String> getUC() {
        Map<String, String> res = new HashMap<String, String>();
        DbUtils.loadDriver(jdbcDriver);
        try {
            conn = DriverManager.getConnection(url, user, passwd);
            QueryRunner qr = new QueryRunner();
            List results = (List) qr.query(conn, "select user_id, text from t_status_info", new BeanListHandler(UserContent.class));
            System.out.println(results);
            for (int i = 0; i < results.size(); i++) {
                UserContent uc = (UserContent) results.get(i);
                if (res.containsKey(uc.getUser_id())) {
                    res.put(uc.getUser_id(), res.get(uc.getUser_id())+" "+uc.getText());
                } else {
                    res.put(uc.getUser_id(), uc.getText());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return res;
    }
}
