
public aspect Logger {

    
    //pointcut success() : call(* signUp*(..) );
    
    //after() : success() {
    //  	System.out.println("**** User created ****");
    //}

    pointcut registered() : call(* signUp*(..) );
    after() : registered() {

        
    }
    
    pointcut loginAndLogout():call(* log*(..) );
    
    after() : loginAndLogout(){
    	
    }
}