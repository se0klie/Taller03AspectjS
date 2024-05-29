
public aspect Logger {

    pointcut success() : call(* signUp*(..) );
    
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut loginAndLogout():call(*(login*(..)||logout*(..)));
    
    after() : loginAndLogout(){
    	
    }
}