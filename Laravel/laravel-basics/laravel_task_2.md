## 1. Laravel Request Lifecycle for `http://localhost:8000/about`

1. **Browser request** → Web server receives `GET /about`.
2. **Front Controller** → `public/index.php` runs:
   - Load Composer autoload (`vendor/autoload.php`).
   - Create application (`bootstrap/app.php`).
   - Resolve HTTP kernel (`App\Http\Kernel`).
3. **Kernel bootstraps**:
   - Load env/config, register service providers, boot providers.
   - Run global middleware (`$middleware` in `Kernel.php`).
4. **Routing**:
   - Load routes (cached or from `routes/web.php`).
   - Match `/about` to route definition.
5. **Route middleware**:
   - Apply group middleware (`web` → sessions, cookies, CSRF).
   - Apply route-specific middleware (e.g., `auth`).
6. **Controller/Closure execution**:
   - Resolve dependencies via service container.
   - Run logic, return view/response.
7. **Response**:
   - Convert to `Illuminate\Http\Response`.
   - Pass back through "after" middleware.
   - Send headers/body to browser.
8. **Terminate**:
   - Run `terminate()` middleware, save session, cleanup.

## 2. Removing the CSRF token from a form in `routes/web.php`

- If you remove `@csrf` from a POST form that is handled by a route inside the `web` middleware group, Laravel's **`VerifyCsrfToken`** middleware will reject the request with a **419 Page Expired** error.
- This happens because Laravel requires a hidden CSRF token in all state-changing requests (POST, PUT, DELETE, etc.) to protect against **Cross-Site Request Forgery** attacks.
- Without the token, Laravel cannot verify that the form came from your application.

---

## 3. Difference between `{{ $variable }}` and `{!! $variable !!}` in Blade

- **`{{ $variable }}`** → Escapes HTML special characters using `htmlspecialchars()`, preventing `XSS` (js injection) attacks. Safe for displaying user input or any content that could be manipulated by an attacker.
  ```php
  {{ "<b>Hello</b>" }} // Output: &lt;b&gt;Hello&lt;/b&gt;
  ```
- ```

  ```

## 4. CSRF Protection

- `csrf` Tokens are unique identifier to each session and stored in each session
- `@csrf` adds a hidden `_token` field in the form
- on submit , Laravel compares the form token with the session token
- when missing or mismatch -> 419 error

## 5. Laravel Views

- Found in `resources/views`
- usually `.blade.php` files and it features
  - Template inheritance: `@extends`, `@section`, `@yield`
  - control structures :`@if`, `@foreach`
  - Escaped output: `{{ }}`
  - Raw output: `{!! !!}`
- Pass data to views via `view('name', ['key' => $value])`
- Blade compiles templates to cached PHP for faster performance

```php
@props(['heading'])


<!DOCTYPE html>
<html lang="en" class="bg-gray-900 text-gray-100">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $heading }}</title>
    @vite('resources/css/app.css', 'resources/js/app.js')
</head>
```
