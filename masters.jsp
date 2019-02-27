<!DOCTYPE>
<html>
    <head>
        <title>masters</title>
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
            .form2
            {
                vertical-align: middle;
                align-self: center;
            }
            
            
            .showthis{
                display: block;
            }
            
            table{
               color: black;
                background-color:brown;
                
                
            }
            
            tr:nth-child(even){background-color: bisque;
            color:firebrick;}
            tr{
                background-color: firebrick;
                 color:bisque;
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
                color: white;
                font-style: bold;
                font-size:30px;
                background-color: brown;
            }
            
            . tableover{
                overflow-x:hidden;
                color: bisque;
                padding: 5px;
                border-collapse: collapse;
                
               
            }
            
            th{background-color: rebeccapurple;
                border: brown;
                border-collapse: collapse;
                font-size: 20px;
                font-style: bold;
                padding: inherit;
                color:bisque;
              }
            
            
            tr:hover,td:hover{
                color: black;
                
            }
        </style>
        
        
        
        
     <script type="text/javascript">
               function func(){
                   document.getElementById("showthis").style.display="block";
               }
               
               
    </script>
    </head>
    
    
    <body>
        <div class="back">
        <h1>MASTERS</h1>
            <div class="form2">
                <center>
                    
        <form action="masters.jsp" method="post">
        
            <table>
            
                <tr>
                    <td>GROUP 1:</td>
                    <td><input type="text" name="grp1" required></td>
                </tr>
                <tr>
                    <td>DESC:</td>
                    <td><input type="text" name="desc1" required></td>
                </tr>
               <tr>
                   <td>GROUP 2:</td>
                   <td><input type="text" name="grp2"></td>
                <tr>
                <tr>
                    <td>DESC:</td>
                    <td><input type="text" name="desc2"></td>
                </tr>
                <tr>
                    <td>PARAM_CODE:</td>
                    <td><input type="text" name="paramcode"></td>
                </tr>
                <tr>
                    <td>PARAM_DESC:</td>
                    <td><input type="text" name="paramdesc"></td>
                </tr>
               <tr>
                   <td>DEPT:</td>
                   <td><input type="text" name="dept" required></td>
                </tr>
            </table>
               
            
            <br>
            <br>
            <button type="submit" name="submit" onclick="func()" >SUBMIT</button>  
            
             </form>
                
                
        
            <form action="main-menu.jsp">
                 <button type="submit" name="submit" >BACK</button> 
           </form>
                </center>
                
                
             <div id="showthis" class="showthis">
                 
                 
            <%@ pageimport="java.sql.*,java.util.*" %>
                      
                
<%
       {
   
         String grp1 = request.getParameter("grp1");
         String desc1= request.getParameter("desc1");
         String grp2 = request.getParameter("grp2");
         String desc2= request.getParameter("desc2");
         String paramcode = request.getParameter("paramcode");
         String paramdesc= request.getParameter("paramdesc");
         String dept = request.getParameter("dept");
         
        
         
        
         
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             
        Statement st= conn.createStatement();
           
        String QueryString= "insert into MASTERS(group1,desc1,group2,desc2,param_code,param_desc,dept)values('"+grp1+"','"+desc1+"','"+grp2+"','"+desc2+"','"+paramcode+"','"+paramdesc+"','"+dept+"')";
    
   
         ResultSet rs=null;
        
        rs=st.executeQuery(QueryString);
       out.println("Data Entered");
   
   
   
     

        
          
    conn.close();
     
     
}
   %>
    

        <center>
            
   <div class="tableover">
            <table border="1" width="100%" > 
              
            <%@ pageimport="java.sql.*,java.util.*" %>
                <tr>
                      
    <%   
                
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
                
                PreparedStatement ps = conn.prepareStatement( "SELECT * FROM MASTERS ORDER BY GROUP1,group2,param_code"); 
             ResultSet rs = ps.executeQuery(); %>
                 
    
        <%
              ResultSetMetaData rsm = rs.getMetaData();
            for (int i=1;i<=rsm.getColumnCount();i++)
                {
                %>
            
           <th><%=rsm.getColumnName(i)%></th>

    <%  } %>
</tr>   
                
 <%
    if(rs!=null)
    {
       while (rs.next()) { %>
    <tr>
    <%
    for(int i = 1; i <= rsm.getColumnCount(); i++){ %>
        <td>
        <%=rs.getString(i)%>
        </td>
    <%
       }
    %>
    </tr>
<%
 }
   
  }
   

   rs.close();
   conn.close();
%>
     
    
 </table>
        </div>
            </center>
        </div>
    </div>
                      <br>
                            <br>
                           
        </div>
            
            </body>
</html>