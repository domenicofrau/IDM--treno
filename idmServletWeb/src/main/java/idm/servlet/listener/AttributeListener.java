package idm.servlet.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AttributeListener implements ServletRequestAttributeListener {

	public void attributeRemoved(ServletRequestAttributeEvent srae) {
	}

	public void attributeAdded(ServletRequestAttributeEvent srae) {

//		System.out.println("attributo: " + srae.getName() + " " + srae.getValue());

	}

	public void attributeReplaced(ServletRequestAttributeEvent srae) {
	}
}
