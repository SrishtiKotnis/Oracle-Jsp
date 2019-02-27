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
            
        </style>
        
    </head>
    
    <body>
      <div class="back">
            
            
            <h1>CHECK POINTS</h1>
            
                        
            <%@ pageimport="java.sql.*,java.util.*"%>
                        
                          <%
                            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
                             
       ResultSet rs =st.executeQuery("SELECT desc2 FROM MASTERS WHERE group1='06' and group2='05' ");
         ResultSetMetaData rsm = rs.getMetaData();
         
        Statement st1=conn.createStatement();
        ResultSet rs1 =st1.executeQuery("SELECT group2,PARAM_CODE,PARAM_DESC FROM MASTERS WHERE group1='06' AND GROUP2='05' order BY param_code ");
         ResultSetMetaData rsm1= rs1.getMetaData();
         %>  
                              
                              
    <table border="5px">
       
        <form action="cpoints.jsp" method="post">
<!--        -->
        
                          <tr>
                              <% if(rs.next()){
                                 int j;
                                 
                               j=rsm.getColumnCount();%>
                                  <th>GROUP1</th>
                                  <th><%=rs.getString(j)%></th>
                                  <th>DESCRIPTION</th>
                                  <th></th>
                                  <th></th>
                                  <th>REMARKS</th>
                        
                              </tr>
                              <%
                                 }%><%
   
if(rs1!= null)
 {
  while(rs1.next())
  { String gcode=rs1.getString("group2");								    
   String  pcode=rs1.getString("param_code");
    %> 
    <tbody>
    <tr> <%
            
 for (int i=1;i<=rsm1.getColumnCount();i++){%>
    <td><%=rs1.getString(i) %></td>
   
  <%
  } %>
      <td><input type="hidden" name="group2" value="<%=gcode%>"></td>
       <td><input type="hidden" name="param_code" value="<%=pcode%>"></td>
       <td><input type="text" name="param_value"></td>
  </tr>
        <tbody><%
  }
 }
          
 
 %>    
            
             <button type="submit">SUBMIT</button>
            </form>
     <%   
                     String[] s1=new String[0];
                     String[] s2=new String[0];
                     String[] s3=new String[0];
                     
                      String pname=null;		  		  
				     Enumeration g=request.getParameterNames();
                     while(g.hasMoreElements()){
                       pname=(String)g.nextElement();
                     if (pname.equals("group2"))
                     {
                       s1=request.getParameterValues(pname);
                     }
                     if(pname.equals("param_code"))
                     {
                      s2=request.getParameterValues(pname);
                     }
                     if(pname.equals("param_value"))
                     {
                      s3=request.getParameterValues(pname);
                     }
         
                       }//while g 
                
                     
                       for(int i=0;i<s1.length;i++){ %>
        
        <%
           
                        
            String qry="insert into transactions(group1,groupr2,param_code,param_value)values('04',?,?,?)";
            PreparedStatement ps= conn.prepareStatement(qry);
        
            ps.setString(1, s1[i]);
            ps.setString(2, s2[i]);
            ps.setString(3, s3[i]);
            ps.executeUpdate();
    
          ps.close(); 
    }
                    
                         %>
            
          
          
</table>
              
                 <form action="roll_assembly2.jsp">
                 <button type="submit" name="submit" >BACK</button> 
           </form>
    </body>
</html>