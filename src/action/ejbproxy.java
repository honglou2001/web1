package action;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ejbproxy {

	public static Context getInitialConnection() {
		final String INIT_FACTORY = "org.jnp.interfaces.NamingContextFactory";
		final String SERVER_URL = "jnp://localhost:1099";
		Context ctx = null;
		try {
			Properties props = new Properties();

			props.put(Context.INITIAL_CONTEXT_FACTORY, INIT_FACTORY);
			props.put(Context.PROVIDER_URL, SERVER_URL);
			ctx = new InitialContext(props);
		} catch (NamingException ne) {
			// TODO: handle exception
			System.err.println("不能连接WebLogic Server在：" + SERVER_URL);
			ne.printStackTrace();
		}
		return ctx;
	}
}
