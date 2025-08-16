## 1. Create The Database

```mariadb
CREATE DATABASE 'database_name'
```

---

## 2. Install Laravel

```bash
laravel new 'project_name'
cd 'project_name'
php artisan serve
```

---

## 3. Connect to MariaDB

- In the `.env` file add the connection parameters.

```env
DB_CONNECTION=mariadb
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE='database_name'
DB_USERNAME=user
DB_PASSWORD=password
```

- Migrate those changes.

```shell
php artisan migrate
```

---

## 4. Plan First (Database Models & Migrations & Factories)

- Define:

  - Entities (Users, Posts, Orders, etc.)
  - Relationships (User has many Posts, Order belongs to User, etc.)
  - Features (Authentication, CRUD, APIs, Notifications).

- Create the models that you want.

```shell
php artisan make:model 'model_name' -m
```

- Seeders & Factories (For Testing)

```shell
php artisan make:seeder 'FactoryName' // Follow the common naming way
php artisan db:seed
```

---

## 5. Routes > Controllers > Views

```php
Route::get('/posts', [PostController::class, 'index']);
```

```php
class PostController extends Controller {
        public function index() {
                $posts = Post::latest()->get();
                return view('posts.index', compact('posts'));
        }
}
```

- I love using `TailwindCSS` so that is the setup <a href="https://tailwindcss.com/docs/installation/framework-guides/laravel/vite">Document</a>

```shell
npm install tailwindcss @tailwindcss/vite
```

- In `vite.config.ts`:

```typescript
import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite"; // add this also
export default defineConfig({
  plugins: [
    tailwindcss(), // add this line
    // …
  ],
});
```

- In `./resources/css/app.css` add this:

```css
@import "tailwindcss";
@source '../../vendor/laravel/framework/src/Illuminate/Pagination/resources/views/_.blade.php';
@source '../../storage/framework/views/_.php';
@source '../**/*.blade.php';
@source '../**/*.js';
```

- In your views make sure that the head has this:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    @vite('resources/css/app.css')
  </head>
  <body>
    <h1 class="text-3xl font-bold underline">Hello world!</h1>
  </body>
</html>
```

```shell
npm run dev
```

---

## 6. Validation & Requests

```shell
php artisan make:request 'StorePostRequest'
```

- Example:

```php
public function rules() {
        return [
                'title' => 'required|min:3',
                'body' => 'required',
        ];
}
```

- Then added to controller:

```php
public function store(StorePostRequest $request) {
        Post::create($request->validated());
}
```

---

## 7. Authentication & Authorization

- Install `Breeze` / `Jetstream` for authentication. // but you should install it at the very beginning of the project
- Use **Policies** for authorization:

```shell
php artisan make:policy PostPolicy --model=Post
```

- Example:

```php
public function update(User $user, Post $post) {
        return $user->id === $post->user_id;
}
```

---

## 8. Jobs & Events

- Heavy tasks → Jobs + Queues.
- Example: sending email when post is created.

---

## 9. Testing

- Write **Feature Tests** for routes and logic.
- Write **Unit Tests** for services.

---

# So it should be like

Database → installation → DB connection → Models → Seeders → Routes → Controllers → Views → Validation → Services → Policies → Background Jobs → Tests.
