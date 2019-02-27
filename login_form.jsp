<!DOCTYPE HTML>
<html>
    
        <head>
            <title>LOGIN_FORM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
             <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            
            
            <style>
            body,html
            {
                height: 100%;
            }
            .back{
                width: 100%;
                height: 100%;
             background-image: url("SAIL.jpg");
                background-repeat: no-repeat;
                background-size:cover;
                background-blend-mode: lighten;
            }
            
                    
            h1{
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
           button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
            }
                
                .f2{
                    border-left-color: aqua;
                    border-color:black;
                    
                }
                
                .table1{
                    border: 5px;
                    border-color: brown;
                    color: antiquewhite;
                }
                        </style>

            
             
 
</head>
        <body>
                <div class="back">
                    <center>   
                        <div class="form1" id="f2">
                <form action="login_form.jsp" method="post">
            <h1>LOGIN</h1>
                    <table class="table1">
                        <tr>USERNAME:<input type="text" name="user" required></tr><br>
                        <tr>PASSWORD:<input type="password" name="pass" required></tr>
                        <br><br>
                        <tr> <button type="submit">SUBMIT</button></tr>
                        
                    </table>
                      </form>
            
                   </div>
    
                    <%@ pageimport="java.sql.*,java.util.*" %>
                        
         <% try
       {
   
         String user= request.getParameter("user");
         String pass= request.getParameter("pass");

            
            if((user!=null)&&(pass!=null))
            
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             
        Statement st=conn.createStatement();
            
    
       
        ResultSet rs=st.executeQuery("Select usern,pass from login_log where usern ='"+user+"' and pass='"+pass+"'");
            
        if(rs.next()){
            out.println("login succesful");
            
        %>
             
             <br>
             <br>
            <form action="sheet_menu.jsp">
                <button type="submit">NEXT</button>
            </form>
             </br>
           <% }
            
              
        else{
              %> <div style=color:red><%out.println("username password incorrect"); %> </div>
               
               <%
              }
            %>
             
               
               <%
                  
                  }
        

        
   
         catch(Exception e){       
          out.println("Something went wrong !! Please try again");       
         }   
     

            
         %>
            </center>

            </div>
    </body>
</html>