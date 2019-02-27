<!DOCTYPE HTML>
<html>
    <head>
        <title>roll-assembly</title>
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
            
        
        </style>

    </head>
        <body>
            
            <div class="back">
                <h1>ROLL ASSEMBLY</h1>
                <%@ page import="java.sql.*,java.util.*"%>
                    
               
 <%     
         DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT unique desc2 FROM MASTERS WHERE GROUP1='06' and group2 in('01','02','03')");
       ResultSetMetaData rsm=rs.getMetaData();
    
  
    %>
     
          
                <center>
     <form action ="roll_assembly2.jsp" method="post">
         
         <table border="5px">
             <tr>
                 <td>ROLL TYPE</td>
                 <td><select name="roll-type">
                 <% while (rs.next())
                    {
                    for(int i=1;i<=rsm.getColumnCount();i++){%>
                 
                      
                       <option value="<%=rs.getString(i)%>">
                     <%=rs.getString(i)%>
                       
                     </option>
                 <%
                 }
                    }
                         %>
                     </select>
                         
                     </td>
                     
                 </tr>
             
             <tr>
                 <td>SET NO.</td>
                 <td><input type="text" name="setno"></td>
             </tr>
    
           
             <tr>
                 <td>POSITION</td>
                 <td><select name="pos">
                     <option value="T">TOP ROLL</option>
                     <option value="B">BOTTOM ROLL</option></td>
             </tr>
             
             
             
         </table>
         
         <button type="submit">SUBMIT</button>
     
    
         <button type="submit" name="SUBMIT" onclick="document.getElementById('form2').style.display= 'block' ; return false; ">SHOW</button>
         </form>
                    <br>
                    <br>
                    
                    <table border="5px">
                    <tr>
                  <td>  
                      <div class="vertical-menu">
                 <a href="ajobs.jsp">ASSEMBLY JOBS</a>
                
                 <a href="cpoints.jsp">CHECK POINTS</a>
                          </div>
                 </td>
                </table>
                              
             </tr>
                </center>
     
                    
        
        <form action="main-menu.jsp" method="post">
          <button type="submit">BACK</button>
        </form>
                
     <%
         String rolltype=request.getParameter("roll-type");
        out.println(rolltype);
        String set=request.getParameter("setno");
         out.println(set);
        
        
        %>
         
         
                     
     <div id="form2" style="display:none">
     
     <%
        
       
       
        
        Statement st1=conn.createStatement();
        ResultSet rs1=st1.executeQuery("SELECT UNIQUE PARAM_CODE, PARAM_DESC FROM MASTERS WHERE GROUP1='06' AND GROUP2 IN ('01','02','03') ORDER BY PARAM_CODE");
        ResultSetMetaData rsm1=rs1.getMetaData();
        %>
         
         
          <div class="bd1">
             <form action="roll_assembly2.jsp>" method="post">
             <table border="5px">
                 
                 
         <%
            if(rs1!=null)
            {
            while(rs1.next())
            {
             %><tr>
               <% for(int j=1;j<=rsm1.getColumnCount();j++){%>
                  
                     <td><%=rs1.getString(j)%></td>
                     
                
             
            <% }
             %><td><input type="text"></td>
              </tr>
           <% }
            }
              %>
        
                
             </table>
                 <button type="submit">SAVE</button>
                 </form>
             
             
            
              </div>
       
                 </div>
           
            </div>
         
        </body>
     
</html>