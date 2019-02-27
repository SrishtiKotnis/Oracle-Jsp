<!DOCTYPE>
<html>
    <head>
        <title>details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
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
                background-size: cover;
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
            
            .vertical-menu {
                column-count:2;
                column-gap: 50px;
                width: 450px;
                

}

.vertical-menu a {
    background-color: gray;
    color: black;
    display: block;
    padding: 12px;
    text-decoration: none;
}

.vertical-menu a:hover {
    background-color: #ccc;
}

.vertical-menu a.active {
    background-color: #4CAF50;
    color: white;
            }
            
            
            .logout{
                align-content: flex-end;
                margin: 10px;
                padding: 2px;
            }
                
        </style>
        
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script>

  $( function() {

    $("#datepicker").datepicker();

  } );

  </script>


    
   
    </head>
    
    <body>
        <div class="back">
                
                    <%@ pageimport="java.sql.*,java.util.*" %>
                        
         <% try
       {
   
         String user= request.getParameter("user");
         String pass= request.getParameter("pass");

            

            
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             
        Statement st=conn.createStatement();
            
    
       
        ResultSet rs=st.executeQuery("Select usern,pass from login_log where usern ='"+user+"' and pass='"+pass+"'");
            
        if(rs.next()){
            out.println("login succesful");
            
         }

        
            
            
        
}
        
   
         catch(Exception e){       
          out.println("Something went wrong !! Please try again");       
         }   
     

                           
         %>
             
            
        
            <center>
                <h1>ENTER DETAILS</h1>
            <%@ pageimport="java.sql.*,java.util.*" %>
         <form action="main-menu.jsp">
          <table>
             <tr>
                 <td>DATE:</td><td><input type="text" id="datepicker" name="date1"></td>
              </tr>
              <tr>
                 <td> SHIFT: </td> <td><select name="shift">
                    <option value="A">A SHIFT</option>
                    <option value="B">B SHIFT</option>
                    <option value="C">C SHIFT</option>
                    <option value="GENERAL">GENERAL SHIFT</option>    
                </select>
                  </td>
                  </tr>
              <tr>
                 <td>SECTION:</td><td><input type="text" name="section"></td>
              </tr>
              <tr>
                 <td>SECTION INCHARGE:</td><td> <input type ="text" name="sec_inc"></td>
              </tr>
              
              
             </table>
             <br>
             <br>
             <button type="submit">SUBMIT</button>
                </form>
               
              
      
                </center>
            </div>
            
        
    </body>