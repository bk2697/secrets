<!-- user logs in and can upload secretes -->
<login>
  <!-- HTML -->
  <button show={ !user } class="btn btn-outline-success my-2 my-sm-0" type="button" onclick={ login }>Login</button>
	<button show={ user } class="btn btn-outline-danger my-2 my-sm-0" type="button" onclick={ logout }>Logout</button>
  <div show={ user } class="">
    <upload></upload>
  </div>


  <script>
    // JAVASCRIPT

    login() {
			var provider = new firebase.auth.GoogleAuthProvider();
			firebase.auth().signInWithPopup(provider);
        //query of current user in collection not found create a new id
        // database.collection('user').isEqual(user.currentUser.uid)
		}

		logout() {
			firebase.auth().signOut();
		}
		// this.on('update', () => {
		// 	this.user = opts.user;
		// 	this.room = opts.room;
		// });

  </script>

  <style>
    /* CSS */
    :scope {}
    .special {
      background-color: #333333;
      color: #FFFFFF;
    }
  </style>
</login>
