<div id="/background_topic">
<table>
  <li><% @project.each do |f| %>
    <%= f.project_name %> are assigned to <%=image_tag current_user.image_url(:thumb).to_s%><br />
      <%= link_to "topics",{:controller => 'topic', :action => 'list', :project_id => f.id}, :class => 'action show'%>
      <%end%></li>
  
  </div>
  
    <!-- add more peoples -->
      
<div id="/background">
<div class="project">
  <a href="#" id="button">Add new User</a>
    <div id="output"></div>
  
  <div id="overlay" class="web_dialog_overlay"> </div>
  <div id="popup" class="web_dialog">
  <%= render :partial => 'newuser' %>
 <input id="close" type="button" value="Close" />
  </div>
</div>
</div>



  <!-- create topics under same project-->

    

<div id="test"><a>Create Topics</a></div>
<div id="new">


  <%= form_for :topic, :url => {:action => 'create_topic'}, :project_id => @project_id, :remote => true do |f| %>
  
    
  <ul>
     <li id="hide"><%= f.select(:project_id, @project.collect {|s| [s.id]})%></td>
   <!-- <th><%= f.hidden_field(:project_id)%></th>-->
    <li><%= f.label(:topic_name) %></th>
    <li><%= f.text_field(:topic_name) %></td>
  </ul>

    <div class="form-buttons">
      <%= f.submit("Add new topic") %>
    </div>
    
  <% end %>
  <div id="cancel">
    <a>dont want to create topics</a>
  </div>
</div>

 </table>

  
 <table>
    <ul>
     
      <th>Topic Name</th>
      
    </ul>
    <% @topics.each do |topic| %>
    <tr>
      
      <th><b><%= topic.topic_name %></b></th>

    
         <th>  <%= link_to ("Add Discussions"),{:controller => 'discussion', :action => 'list',:topic_id => topic.id}, :onclick => "sho(); return true;",:class => 'action show'%>
            </th> 
                
            <th>  <%= link_to ("To do list"),{:controller => 'todo', :action => 'list',:topic_id => topic.id}, :class => 'action show'%>
            </th>
             <th>  <%= link_to ("Text Files"),{:controller => 'todo', :action => 'list',:topic_id => topic.id}, :class => 'action show'%>
            </th>
            <!--  -->
<tr>
            <th>
              <hr>
              <table>
                <ul>
              
                <li><a>Discussions:</a></li><br />
                 <% topic.discussions.each do |discussion| %>
               <li contenteditable data-title=""><b><%= discussion.name %></b> </li>
               <!-- add discussions -->

              <%end%>
           


             <!--     <li id="/more"></li> 
                    <li>
                     <%= link_to_function 'Add more discussion:',"jQuery('#more').append('#{escape_javascript render(:partial => 'shared/discussion',:object =>Discussion.new)}')" %>
                     </li>-->
           
              </ul>
           
              </table>
              <li><%= render :partial => 'shared/discussion'%></li>
            </th>
</tr>
<tr>
             <th>
              <table>
                <ul>
              
                <li><a>Todos:</a></li><br />
                 <% topic.todos.each do |todo| %>
               <li contenteditable data-title="">
                <b><%= todo.visible %></b> 
                <b><%= todo.priority %></b> 
                <b><%= todo.add %></b> </li>
                 <%end%>
        
              </ul>
           
              </table>
               <li><%= render :partial => 'shared/todo'%></li>
            </th>
            </tr>
          </tr>
    <% end %>
  </table>

</div>