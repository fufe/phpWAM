<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>User List - {$app_name}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="{$themepath}/settings.css" type="text/css" />
    </head>

    <body>
        <div id="users">
            <table>
                <thead>
                    <tr>
                        <th>Név</th>
                        <th>Login</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$users item="user"}
                        <tr>
                            <td>{$user.Name}</td>
                            <td><a href="/edit_user_details/?user={$user.ID}">{$user.Login}</a></td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </body>
</html>
