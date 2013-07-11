[![Mold](https://wirelab.s3.amazonaws.com/images/wirelab_logo.png)]

# Mold
## Styling library for admin interfaces
Mold is a simple collection of default stylesheets and re-usable elements for molding
admin interfaces to suite our taste

# Requirements

Nothing

# Usage

See the Wiki

# Installing on Rails

Add to your gemfile:


    gem 'mold', github: 'wirelab/mold'

    bundle install


If you want to use the default layout:

    bundle exec mold layout

# Wirelab backend html structure
If you’re adding devise login to the wirelab admin, the structure should look like this.
It has it’s own application.html.erb layout
Body class device (sorry typo in css)
A div with a class container
The rest of devise is the standard generated view.

## The main view of the admin
The structure of the admin application view should look like this:
<body class="<%= yield (:body_class) %>">
  <div class="main">
    <section class="panel_top">
      <div class="logo_holder">
        <a href="/admin" class="logo">admin</a>
      </div>
      <%= render partial: 'wirelab_admin/admin/admin_info' %>
    </section>
    <section class="panel_left">
      <%= render partial: 'wirelab_admin/admin/menu' %>
    </section>
    <section class="panel_left_footer">
      <a href="http://www.wirelab.nl/" target="_blank">Wirelab Admin</a> | Versie 1.0.0 | <a href="http://www.wirelab.nl/" target="_blank">By Wirelab</a>
    </section>
    <section class="panel_right">
      <% unless flash.empty? %>
        <div id="flash">
          <% flash.each do |key, value| -%>
            <div id="flash_<%= key %>"><%= value %></div>
          <% end -%>
        </div>
      <% end %>
      <%= yield %>
    </section>
  </div>
</body>

The partial admin info should contain a gravatar image and the current admin user email
The layout should look like this:
<% if false #current_admin.present? %>
  <div class="profile_holder">
    <div class="profile_picture">
      <%= image_tag "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(current_admin.email.downcase)}.png?s=64" %>
    </div>
    <div class="profile_name">
      <%= current_admin.email %>
    </div>
    <div class="profile_edit">
      <ul>
        <li><%= link_to "Uitloggen", destroy_admin_session_path, :method => :delete %></li>
      </ul>
    </div>
  </div>
<% end %>

The partial menu can contain main menu items and submenu items.
The layout should look like this:
<nav>
  <ul>
    <li><a href="#">menu item</a>
      <ul>
        <li><a href="#">submenu item</a></li>
      </ul>
    </li>
  </ul>
</nav>

## The content
There are two ways the content layout can look like, the both start with the same header.
In the header is the title of that page, and optional a button aligned on the right.
<header class="head">
  <a href="/" class="button">+ Nieuw</a>
  <h2>Form input elements</h2>
</header>

Then there is an option for content/forms/etc and an option for tables.
The html for content should look like this:
<div class="content">
  content
</div>

And the html for a table should look like this:
<table class="table responsive">
  <thead>
    <tr>
      <th>Afbeelding</th>
      <th>Url</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="http://placehold.it/20x20"></td>
      <td>something</td>
      <td><a href="#"><i class="icon-eye-open"></i></a></td>
      <td><a href="#"><i class="icon-pencil"></i></a></td>
      <td><a href="#"><i class="icon-trash"></i></a></td>
    </tr>
  </tbody>
</table>

Available options for content:
All standard kitchensink items are possible.
h1 to h6, p, a are styled.
form items have to be wrapped in a div with the class input to be aligned perfect, they should look like this:
<div class="input">
  <label>label text</label>
  <input type="text">
</div>
Checkboxes and Radio buttons should have an extra span wrapped around each label and input item, with the class of the item:
<div class="input">
  <span class="checkbox">
    <label>radio</label>
    <input type="radio">
  </span>
  <span class="checkbox">
    <label>radio</label>
    <input type="radio">
  </span>
</div>
The submit and reset button can be placed in the form directly, they don’t have to be wrapped by a div.