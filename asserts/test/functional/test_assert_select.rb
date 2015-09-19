#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'application'

# Re-raise errors caught by the controller.
class DummyController < ApplicationController
  def rescue_action(e) 
    raise e 
  end
end

def create_fixtures(*names)
end

class DummyControllerTest < Test::Unit::TestCase
 
 HTML = %{ 
   <html>
   <head>
     <title>La Librairie Pragmatique</title>
     <!-- ... -->
   </head>

   <body id="store">
     <div id="banner">
       <img src="/images/logo.png"> La Librairie Pragmatique
     </div>

     <div id="columns">
       <div id="side">
         <div id="cart">
           <div class="cart-title">Votre Panier</div>
           <table>
             <tr>
               <td>1&times;</td>
               <td>Bien développer pour le Web 2.0</td>
               <td class="item-price">42.00 €</td>
             </tr>

             <tr>
               <td>1&times;</td>
               <td>Design Web : utiliser les standards</td>
               <td class="item-price">33.00 €</td>
             </tr>

             <tr class="total-line">
               <td colspan="2">Total</td>
               <td class="total-cell">75.00 €</td>
             </tr>
           </table>

           <form method="post" action="/store/checkout" class="button-to">
             <div>
               <input type="submit" value="Payer">
             </div>
           </form>

           <form method="post" action="/store/empty_cart" class="button-to">
             <div>
               <input type="submit" value="Vider le panier">
             </div>
           </form>
         </div>
         <a href="http://www....">Accueil</a><br>
         <a href="http://www..../faq">Questions</a><br>
         <a href="http://www..../news">Actualités</a><br>
         <a href="http://www..../contact">Contact</a><br>
       </div>

       <div id="main">
         <h1>Votre catalogue pragmatique</h1>

         <div class="entry">
           <img src="/images/auto.jpg">

           <h3>Bien développer pour le Web 2.0</h3>


           <p>Adieu, absence d'accessibilité, soupes de balises, combinaisons de Javascript propriétaires et autres mauvais réflexes qui polluaient le Web 1.0. Créer des interfaces utilisateur bluffantes et interactives à la Web 2.0 (Gmail, Google Maps, Flickr, Netvibes...) est l'occasion d'instaurer de bonnes pratiques de développement garantissant le respect des normes, l'ergonomie et l'accessibilité des applications web.</p>

           <div class="price-line">
            <p></p>
             <span class="price">42.00 €</span> 
             <!-- ... -->
           </div>
         </div>
         <!-- ... -->
       </div>
     </div>
   </body>
   </html>

}
  def setup_with_fixtures
  end
  
  def setup
    @controller = DummyController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @response.body = HTML
  end
  
  def teardown_without_fixtures
  end
  
  def test_one
    assert_select "title"
    assert_select "title", "La Librairie Pragmatique"
    assert_select "title", /Pragmatique/
 end
 
 def test_cart_long
   assert_select "div#cart"
   assert_select "div#cart table tr", 3
   assert_select "div#cart table tr.total-line td:last-of-type", "75.00 €"
  end
   
 def test_xx
   p(css_select("div :first-child").map(&:name))
 end
 def test_cart   
    assert_select "div#cart" do
      assert_select "table" do
        assert_select "tr", :count => 3
        assert_select "tr.total-line td:last-of-type", "75.00 €"
      end
    end
  end
end
#---