package com.kh.dev.student.control;

import com.kh.dev.student.action.Action;
import com.kh.dev.student.action.IdCheckAction;
import com.kh.dev.student.action.IndexAction;
import com.kh.dev.student.action.LoginFormAction;
import com.kh.dev.student.action.LoginProcAction;
import com.kh.dev.student.action.LogoutAction;
import com.kh.dev.student.action.ModifyFormAction;
import com.kh.dev.student.action.ModifyProcAction;
import com.kh.dev.student.action.RegFormAction;
import com.kh.dev.student.action.RegProcAction;
import com.kh.dev.student.action.ZipCheckAction;
import com.kh.dev.student.action.DeleteFormAction;
import com.kh.dev.student.action.DeleteProcAction;

//싱글톤 방식으로 구현 ( 계속해서 호출 할 예정이기 때문 )
public class ActionFactory {
	private static ActionFactory factory;

	public static synchronized ActionFactory getInsctance() {
		if (factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}

	private ActionFactory() {
	}

	public Action getAction(String cmd) {
		Action action = null;
		switch (cmd) {
		case "/index.do":
			action = new IndexAction();
			break;
		case "/login.do":
			action = new LoginFormAction();
			break;
		case "/loginProc.do":
			action = new LoginProcAction();
			break;
		case "/logout.do":
			action = new LogoutAction();
			break;
		case "/regForm.do":
			action = new RegFormAction();
			break;
		case "/idCheck.do":
			action = new IdCheckAction();
			break;
		case "/regProc.do":
			action = new RegProcAction();
			break;
		case "/modifyForm.do":
			action = new ModifyFormAction();
			break;
		case "/modifyProc.do":
			action = new ModifyProcAction();
			break;
		case "/deleteForm.do":
			action = new DeleteFormAction();
			break;
		case "/deleteProc.do":
			action = new DeleteProcAction();
			break;
//		case "idCheck":
//			action = new IdCheckAction();
//			break;
		case "/zipCheck.do":
			action = new ZipCheckAction();
			break;
		default:
			action = new IndexAction();
			break;
		}
		return action;
	}
}
