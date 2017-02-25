/*package dao;

public class delete {
	String query="INSERT INTO SAM_CUSTOMER(CUST_ID,CUST_NAME,CUST_ADDRESS,CUST_MOBILE,CUST_MAILID) VALUES (CUST_ID_SEQ.nextval,?,?,?,?)";

     
    prepareStmt=connection.prepareStatement(query);
    prepareStmt.setString(1, customer.getName());
    prepareStmt.setString(2, customer.getAddress());
    prepareStmt.setLong(3, customer.getMobile());
    prepareStmt.setString(4, customer.getEmailid());
     
    prepareStmt.executeUpdate();
}
*/

/*
Hello,
I have 5 tables. They all have ID column. To fill it, I am using a sequence called ID_SEQ. When I try to insert record into those 5 tables using ID_SEQ.nextval, each subsequent table get ID number bigger than the previous table. Is there a way to save ID_SEQ.nextval to a String variable which I can use in all the insert statements? I am trying to insert into tables from JDBC. 
Thanks
*/