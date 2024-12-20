package co.kh.dev.mvc.control;

import co.kh.dev.mvc.action.Action;
import co.kh.dev.mvc.action.IndexAction;

//싱글톤 방식으로 구현 ( 계속해서 호출 할 예정이기 때문 )
public class ActionFactory {
	private static ActionFactory factory;

	public static synchronized ActionFactory getInsctance() {
		if (factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}

	private ActionFactory() {}
	
	public Action getAction(String cmd) {
		Action action = null;
		
		if(cmd.equals("/index.do")) {
			action = new IndexAction();
		}
		return action;
	}
}