<!-- log in option to upload and see feed  -->
<app>
  <!-- HTML -->
 <div class="container">
    <div class="row">
  		<div class="col">
        <h1> Secrets </h1>
        <p> Secrets is a community platform that allows you to share life-changing events that might be defining your life annoymously. Hopefully, through sharing your troubles, the process of healing can start. </p>
      </div>
    </div>
  </div>
  <login></login>

  <script>
    // JAVASCRIPT
    firebase.auth().onAuthStateChanged(userObj => {
			if (userObj) {
				this.user = userObj;
			} else {
				this.user = null;
				this.room = null;
			}
			this.update();
		});
</script>
 


  <style>
    /* CSS */
    :scope {}
    .special {

      background-color: #333333;
      color: #FFFFFF;
    }
  </style>
</app>
