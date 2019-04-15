<upload>

  <!-- HTML -->
  <!-- add nex secret  -->
  <form class="" method="post">
    <div class="form-group">
      <label for="url-upload">URL of your SECRET</label>
      <input type="url" name="image" value="" class="form-control col-6" placeholder="URL of the image" ref="secretURl" onchange={ secretURL }>
      <small class="form-text text-muted">We'll never share your secret with anyone else.</small>
    </div>
    <img if={ secretUrl } src={ secretUrl } alt="">
    <button type="button" name="button" class="btn btn-primary" onclick={ postSecret }>Post</button>
  </form>
  <br>
  <!-- feed old secrets -->
  <button type="button" name="button" class="btn btn-primary" onclick={ mySecrets }>My Secrets</button>



  <script>
    // JAVASCRIPT

    //set up database
    let database = firebase.firestore();
    //set up secret image url
    this.secretUrl = "";
    // updating secret image url
    secretURL(e){
      this.secretUrl = this.refs.secretURl.value;
    }
    //make reference to all secrets collection
    let secretsRef = database.collection('secrets');
    //make reference to user
    let user = firebase.auth();

    //array for users secrets
    this.userSecrets = [];



    postSecret(e){
      // creates a new secret
      let secretKey = secretsRef.doc().id;

      let secret = secretsRef.doc(secretKey).set({
  			url: this.secretUrl,
  			timestamp: firebase.firestore.FieldValue.serverTimestamp(),
        id: secretKey
  		});

      this.userSecrets.push(secret);
      this.update();

      //creates user document
      let userRef = database.collection('user').doc(user.currentUser.uid)
      userRef.set({
  			id: user.currentUser.uid
  		});

      //adds secrets to user
      let userSecretsRef = userRef.collection('secrets');
      userSecretsRef.doc(secretKey).set({
  			url: this.secretUrl,
  			timestamp: firebase.firestore.FieldValue.serverTimestamp(),
        id: secretKey
  		});
    };

    mySecrets() {
      database.collection(user.currentUser.uid).orderBy('timestamp','asc')
			.startAfter(this.lastTimestamp).limit(3).get().then(snapshot => {
				this.items = [];
				snapshot.forEach(doc => {
					this.items.push(doc.data());
				});

				this.lastTimestamp = this.items[this.items.length - 1].timestamp;
				this.update();
			});
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


</upload>
