<?php

return [
    'driver'        => 'pdo_mysql',
    'host'          => getenv('DB_HOST'),
    'user'          => getenv('DB_USER'),
    'password'      => getenv('DB_PASS'),
    'dbname'        => getenv('DB_NAME'),
    'charset'       => 'utf8',
    'mapping_types' => [
        'enum' => 'string'
    ]
];

