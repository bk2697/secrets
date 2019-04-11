<!-- log in option to upload and see feed  -->
<app>
  <!-- HTML -->
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
