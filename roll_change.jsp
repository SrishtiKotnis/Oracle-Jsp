<!DOCTYPE HTML>
<html>
    <head>
        <title>roll-changing</title>
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
                color: brown;
                background-color: bisque;
            }
            button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
            }
        </style>
        
        <body>
            
            <div class="back">
                <h1>ROLL CHANGING</h1>
                <%@ page import="java.sql.*,java.util.*"%>
                    
                    
                <center>
                  <table border="5px">
 <% 
            {
    
        
    
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT DESC2,PARAM_DESC FROM MASTERS WHERE GROUP1='02' order by group2");
       ResultSetMetaData rsm=rs.getMetaData();
    
  
    %>
     
     
         

             
<%
   
if (rs != null)
 {
  while(rs.next())
  { %> 
    <tbody>
    <tr> <%
 for (int i=1;i<=rsm.getColumnCount();i++)
  {
  %>
    <td><%=rs.getString(i) %></td>
   
  <%
  } %>
       <td><input type="text"></td>
  </tr>
        <tbody><%
  }
 }
          }
 
 %>
             

                
   </table>
             
    

     </center>
     <center>
         <form action="roll+change.jsp" method="post">
           <button type="submit">SUBMIT</button>
         </form>
                </center>
        
        <form action="main-menu.jsp" method="post">
        
            <button type="submit">BACK</button>
        </form>
                
            </div>
        </body>
</html>