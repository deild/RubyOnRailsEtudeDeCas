Droppables.add("pending_todos", {
  accept:'completed_todo', 
  hoverclass:'hover', 
  onDrop:function(element){
    new Ajax.Request('/user/todo_pending/236', {
      asynchronous:true, 
      evalScripts:true, 
      parameters:'todo=' + encodeURIComponent(element.id.split('_').last())
    });
  }
});
