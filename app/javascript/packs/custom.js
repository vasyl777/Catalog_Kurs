import Rails from "@rails/ujs"
export function pagination_js(button) {
  var sugar_substitute_selector = document.getElementById("sugar_substitute")
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "page="+button.dataset.page+"&sugar_substitute="+sugar_substitute_selector.value,
    success: function(response){
      console.log("succses response")

      //window.location.href=  window.location.href
    },
    error: function(response){
      console.log("error")
    }
  })
}
export function change_sugar_substitute(selector) {
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "sugar_substitute="+selector.value,
    success: function(response){
      console.log("succses response")

      //window.location.href=  window.location.href
    },
    error: function(response){
      console.log("error")
    }
  })
}
export function search(text) {
  console.log(window.location.href.split("/"))
  Rails.ajax({
    type: "GET",
    url: window.location.href,
    data: "search="+text,
    success: function(response){
      console.log("succses response")
      //window.location.href=  window.location.href
    },
    error: function(response){
      console.log("error")
    }
  })
}
