<!DOCTYPE>
<html>
    <head>
        <title>hot-saw</title>
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
            button{
                color:white;
                border:none;
                font-size:16px;
                 display: inline-block;
                text-align: center;
                background-color: brown;
            }
            
            h1{
                background-color: bisque;
                color: brown;
            }
            urh{
                display: none;
                
                
            }
            
            .vertical-menu {
                align-content: flex-end;
                column-gap: 50px;
                width: 200px;
                }

.vertical-menu a {
    background-color: brown;
    color: white;
    display: block;
    padding: 12px;
    line-height: inherit;
    text-decoration: none;
}

.vertical-menu a:hover {
    background-color: darkred;
}

.vertical-menu a.active {
    background-color: darkblue;
    color: white;
            }
            
            
            table{
                column-count:2;
                background-color: brown;
                color: white;
                border-color: darkred;
            }
            
        </style>
        
    </head>
    
    <body>
        <div class="back">
            
            
            <h1>ROLL ASSEMBLY</h1>
            
                        
            <%@ pageimport="java.sql.*,java.util.*"%>
                        
                          <%
                            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT unique group2,DESC2,param_code,PARAM_DESC FROM MASTERS WHERE group1='06' AND GROUP2 IN('01','02','03') order by group2,param_code ");
         ResultSetMetaData rsm = rs.getMetaData();
         %>

         <br>
         
                              <table border="2px">
                                     <div class="vertical-menu">
                 <a href="ajobs.jsp">ASSEMBLY JOBS</a>
                 <a href="cpoints.jsp">CHECK POINTS</a>
                
                
                              </div>
                              
        <%
   
if(rs!= null)
 {
  while(rs.next())
  { %> 
    <tbody>
    <tr> <%
            
 for (int j=1;j<=rsm.getColumnCount();j++){%>
    <td><%=rs.getString(j) %></td>
   
  <%
  } %>
       <td><input type="text"></td>
  </tr>
        <tbody><%
  }
 }
          
 
 %>    
     
          
          
</table>
                  <form action="main-menu.jsp">
                 <button type="submit" name="submit" >BACK</button> 
           </form>    
            
            
        </div>
    </body>
</html>
                    