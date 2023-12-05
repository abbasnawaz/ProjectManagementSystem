import { Controller } from "@hotwired/stimulus"
// import { Controller } from "stimulus";

// Connects to data-controller="priority"
export default class extends Controller {
  connect(){
    const index = this.index
    console.log("JS working in controller" + index);
  }

  initialize() {
    this.element.setAttribute("data-action", `change->priority#updatePriority`);
  }
  
  updatePriority(event) 
  {

    console.log(event);
    const targetElement = event.target;
    const index = this.data.get("index");
    if (targetElement instanceof HTMLSelectElement) 
    {
      const selectedValue = targetElement.value;
      console.log(`Selected value at index ${index}: ` + selectedValue);
      try {
        $.ajax({
          url: `/edit_task/${index}`,
          method: 'PATCH',
          contentType: 'application/json',
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          data: JSON.stringify({ task: { priority: selectedValue,
                                             task_type: 1 } }),
          success: function(response) {
            console.log(response);
            console.log("Task selected")
             var updatedContent = $(response).find('#tasks-table').html();
             $('#tasks-table').html(updatedContent);
            console.log('DOM updated with new content:', updatedContent);
          },
          error: function(xhr, status, error) {
            alert("Task failed")
          }
        });
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }

        
          const responseData = response.json();
          
          console.log('Response data:', responseData);
        } catch (error) {
          console.error('Error:', error.message);
        }
      } else {
      console.error("Error: Unexpected target element or undefined.");
    }

    
      



  }


}
