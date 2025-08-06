<?php

namespace Http\Forms;

use Core\Validator;
use Core\ValidationException;

class LoginForm
{
    protected $errors = [];

    public function __construct(public array $attributes = [])
    {

        if (!Validator::email($this->attributes['email'] ?? '')) {
            $this->errors['email'] = 'Please provide a valid email address.';
        }

        if (!Validator::string($this->attributes['password'] ?? '', 6)) {
            $this->errors['password'] = 'Please provide a valid password.';
        }

        return empty($this->errors);
    }
    public function throw()
    {
        ValidationException::throw($this->errors(), $this->attributes);
    }

    public function failed()
    {
        return count($this->errors);
    }
    public static function validate($attributes)
    {
        $instance = new static($attributes);

        return $instance->failed() ? $instance->throw() : $instance;
    }

    public function errors()
    {
        return $this->errors;
    }

    public function error($field, $message)
    {
        $this->errors[$field] = $message;
        return $this;
    }
}
