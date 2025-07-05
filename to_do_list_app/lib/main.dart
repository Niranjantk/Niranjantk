import 'package:flutter/material.dart';
import 'package:to_do_list_app/Pages/home_Page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageToDo(),
    );
  }
}



/*Ah, you're diving into `json-server`—love it! That command is the go-to for spinning up a quick fake REST API from a local `db.json` file. Here’s what’s happening and how to run it properly:

---

### 🛠️ **Command**
```bash
json-server --watch db.json
```

### 📦 **What it does**
- Serves the content of `db.json` as a RESTful API
- Watches for file changes and updates the server on the fly
- Defaults to `http://localhost:3000`

For example, if your `db.json` looks like:
```json
{
  "posts": [
    { "id": 1, "title": "hello" },
    { "id": 2, "title": "world" }
  ]
}
```
You’ll get endpoints like:
- `GET http://localhost:3000/posts`
- `GET http://localhost:3000/posts/1`
- `POST`, `PUT`, `DELETE` work too!

---

### 🚀 **Quick Setup Steps**
1. Install `json-server` globally (if you haven’t):
   ```bash
   npm install -g json-server
   ```

2. Save your JSON file as `db.json`

3. Start the server:
   ```bash
   json-server --watch db.json
   ```

---

### 🌍 Want to access it from other devices?
You’ll need to:
- Get your local IP using `ipconfig` (Windows) or `ifconfig` (Mac/Linux)
- Start the server like:
  ```bash
  json-server --host 0.0.0.0 --port 3000 --watch db.json
  ```
- Then access from other devices using something like:
  ```
  http://192.168.x.x:3000/posts
  ```

Let me know if you want to deploy it to a live server on the internet—I can help you with that too.
*/