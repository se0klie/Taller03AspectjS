import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;

import com.bettinghouse.Person;
import com.bettinghouse.User;

public aspect Logger {

    
    //pointcut success() : call(* signUp*(..) );
    
    //after() : success() {
    //  	System.out.println("**** User created ****");
    //}

    pointcut registered(User user) : call(* *.successfulSignUp(..)) && args(user,..);

    after(User user) : registered(user) {
    	logToFile("Register.txt", "Registrar usuario",user.getNickname());    	
    }

    pointcut loginAndLogout(User user):call(* effective*(..)) && args(user);

    
    after(User user) : loginAndLogout(user){
    	String action= thisJoinPoint.getSignature().getName().startsWith("effective")?"Iniciar sesión":"Cerrar sesión";
    	
    	logToFile("Log.txt", action, user.getNickname());
    }
    
    private void logToFile(String fileName, String action, String username) {
    	try(BufferedWriter writer= new BufferedWriter(new FileWriter(fileName,true))){
    		writer.write("Sesion iniciada por usuario" + username + "Hora:" + LocalDateTime.now() + "\n");
    	}catch(IOException e) {
    		e.printStackTrace();
    	}
    }
}