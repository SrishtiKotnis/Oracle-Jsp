<!DOCTYPE HTML>
<html>
    <head>
        <title>crane-status</title>
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
             background-color: bisque;
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
        </style>
        
        <body>
            
            <div class="back">
                <h1>CRANE STATUS</h1>
                <%@ page import="java.sql.*,java.util.*"%>
                    
                    
                <center>
                  <table border="5px">
                      
                      <%@ pageimport="java.sql.*,java.util.*"%>
                          
                          
                          
                      <% String date2=(String)session.getAttribute("thedate");
                          String shift=(String)session.getAttribute("theshift");
                          String section=(String)session.getAttribute("thesection");
                          String incharge=(String)session.getAttribute("theincharge");
                         %>
                         
                          <%
                            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st=conn.createStatement();
        ResultSet rs =st.executeQuery("SELECT group2,desc2 FROM MASTERS WHERE group1='05'");
         ResultSetMetaData rsm = rs.getMetaData();
         
        Statement st1=conn.createStatement();
        ResultSet rs1 =st1.executeQuery("SELECT param_code,PARAM_DESC FROM MASTERS WHERE group1='05' order by param_code");
         ResultSetMetaData rsm1 = rs1.getMetaData(); 
         
                          
                          %>
                              
            
                          <tr>
                              <% if(rs.next()){
                                 int j;
        
                                 for(int i=1;i<=rsm.getColumnCount();i++){%>
                              <th><%=rs.getString(i)%></th>
                                  <% }
                                      }%>
                             <th>OK</th>
                              <th>NOT OK REASONS</th>
                              </tr>
                             
                              
                          <% if((rs1!=null)&&(rs!=null))
                             {
                              while((rs1.next())&&(rs.next()))
                             { 
                             
                               String gcode=rs.getString("group2");								 
                               String pcode=rs1.getString("param_code");
                             %> 
                              
                                   
                              <tr>
                                  <input type="hidden" name="groupr2" value="<%=gcode%>">
                                  <input type="hidden" name="param_code" value="<%=pcode%>">
                                  
                                    <% for(int i=1;i<=rsm1.getColumnCount();i++){%>
                                      <td> <%=rs1.getString(i)%> </td>
                                          
                                  <%
                                          }%>
                                      
                                    
                                  <td><select name="param_value">
                                      <option value="ok">OK</option>
                                      <option value="not ok" >NOT OK</option>
                                      </td>
                                  <td><input type="text" name="param_value2"><td>   
                                      
                              </tr>
                              
                                       
                          <%
                          
                         
                                }
                             }
                             
                          %>
                              
                    </table>
                     <br>
                              <br>
                              
                                          
                   <form action="crane-status.jsp" method="post">
                       <button type="submit">SUBMIT</button>
                                  </form>
                 
                    
                    </center>
                    
                            
    <%    Connection conn1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
       Statement st2=conn1.createStatement();
       
                   out.println("Data Entered");
                     String[] s1=new String[0];
                     String[] s2=new String[0];
                     String[] s3=new String[0];
                     String[] s4=new String[0];
                     
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
                      if(pname.equals("param_value2"))
                    {
                      s4=request.getParameterValues(pname);
                    }
         
                       }//while g 
                
                     
                       for(int i=0;i<s1.length;i++){ %>
        
        <%
           
                        
            String qry="insert into transactions(group1,groupr2,param_code,param_value,param_value2,t_date,shift,section,section_inc)values('05',?,?,?,?,'"+date2+"','"+shift+"','"+section+"','"+incharge+"')";
            PreparedStatement ps= conn1.prepareStatement(qry);
        
            ps.setString(1, s1[i]);
            ps.setString(2, s2[i]);
           ps.setString(3, s3[i]);
           ps.setString(4, s4[i]);
            ps.executeUpdate();
    
         
           
           out.println("Data Entered");
    
                 
            ps.close(); }
                         %>  
            
            
                         
  <table border='5px'>  
    <%     
            
                     Connection conn2= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:devp","srishti","srishti03");
             PreparedStatement ps2 = conn2.prepareStatement( "SELECT param_code,param_value,param_value2,t_date,shift,section,section_inc FROM TRANSACTIONS  where GROUP1='05' order by group1"); 
             ResultSet rs2 = ps2.executeQuery(); %>
                 
    
        <%
              ResultSetMetaData rsm2 = rs2.getMetaData();
            for (int i2=1;i2<=rsm2.getColumnCount();i2++)
                {
                %>
            
           <th><%=rsm2.getColumnName(i2)%></th>

    <%  } %>
</tr>   
               
 <%
    if(rs2!=null)
    {
       while (rs2.next()) { %>
    <tr>
    <%
    for(int i1 = 1; i1 <= rsm2.getColumnCount(); i1++){ %>
        <td>
        <%=rs2.getString(i1)%>
        </td>
    <%
       }
    %>
    </tr>
<%
 }
   
  }
   

   rs2.close();
   conn2.close();
       
       %>
    </table>
                              
                                  
                                  
                                  
                                  
                                  
                                  
                                
                    
                   <form action="main-menu.jsp" method="post">
                       <button type="submit">BACK</button>
                                  </form>
                
            </div>
                 
        </body>
            
        </html>