<?php

//namespace AramisAuto\Behat;

use Behat\Behat\Context\ClosuredContextInterface;
use Behat\Behat\Context\TranslatedContextInterface;
use Behat\Behat\Context\BehatContext;
use Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        // Initialize your context here
    }


    public function canIntercept()
    {
        $driver = $this->getSession()->getDriver();
        if ($driver instanceof GoutteDriver) {

            return true;
        } else if ($driver instanceof Selenium2Driver) {

            return false;
        }

        throw new UnsupportedDriverActionException(
            'You need to tag the scenario with '.
            '"@mink:goutte" or "@mink:symfony". '.
            'Intercepting the redirections is not '.
            'supported by %s', $driver
        );
    }

    /**
     * @Given /^(.*) without redirection$/
     */
    public function theRedirectionsAreIntercepted($step)
    {
        if ($this->canIntercept()) {
            $this->getSession()
                 ->getDriver()
                 ->getClient()
                 ->followRedirects(false);
        }

        return new Step\Given($step);
    }

    /**
     * @When /^I follow the redirection$/
     * @Then /^I should be redirected$/
     */
    public function iFollowTheRedirection()
    {
        if ($this->canIntercept()) {
          $client = $this->getSession()
                       ->getDriver()
                       ->getClient()
                       ->followRedirects(true)
                       ->followRedirect();
        }
    }

    /**
    * @When /^(?:|I )wait for the suggestion box to appear$/
    */
    public function iWaitForTheSuggestionBoxToAppear()
    {
        $this->getSession()->wait(5000,
          "$('#resultsx_market_price').children().length > 0"
        );
    }

    /**
    * @When /^(?:|I )wait for "([^"]*)" second(?:|s)$/
    */
    public function iWaitForXsec($seconds)
    {
        $this->getSession()->wait(1000 * $seconds);
    }

    /**
    * @When /^(?:|I )switch to iframe "([^"]*)"$/
    */
    public function iSwitchToIframe($iFrameLocator)
    {
        $this->getSession()->switchToIFrame($iFrameLocator);
    }

    /**
    * @When /^(?:|I )switch to parent$/
    */
    public function iSwitchToParent()
    {
        $this->getSession()->switchToWindow();
    }

    /** Click on the element with the provided xpath query
     *
     * @When /^(?:|I )click on "([^"]*)"$/
     */
    public function iClickOnTheElement($locator)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find('css', $locator);

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS selector: "%s"', $locator));
        }

        $element->click();
    }

    /**
     * @When /^(?:|I )manually press "([^"]*)" with "([^"]*)"$/
     */
    public function manuallyPress($locator, $value)
    {
        $session = $this->getSession();
        $session->executeScript("$('$locator').attr('value', '$value')");
    }
    
    /**
     * @When /^(?:|I )fill in "([^"]*)" with unique email$/
     */
    public function iFillWithUniqueEmail($locator)
    {
        $uniqueEmail = uniqid()."testbehat@yopmail.com";
        $session = $this->getSession();
        $session->executeScript("$('$locator').attr('value', '$uniqueEmail')");
    }
}
