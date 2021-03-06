#ifndef MAINNWINDOW
#define MAINNWINDOW

// For usage of Qt native macro SIGNAL() and SLOT()
#ifndef WT_NO_SLOT_MACROS
#define WT_NO_SLOT_MACROS
#endif // WT_NO_SLOT_MACROS

// For disabling boost warnings
#ifndef BOOST_SIGNALS_NO_DEPRECATION_WARNING
#define BOOST_SIGNALS_NO_DEPRECATION_WARNING
#endif // BOOST_SIGNALS_NO_DEPRECATION_WARNING

#include <Wt/WContainerWidget>
#include <Wt/WNavigationBar>
#include <Wt/WMessageBox>

#include "Web/UI/authwidgets.h"
#include "Web/UI/windowintro.h"
#include "Web/UI/windowimageedit.h"

#include "Utilities/Logger/logger.h"

#include "DataBase/databasemanagerwt.h"

using namespace Wt;

namespace Web
{
namespace Ui
{
class MainWindow : public WContainerWidget
{
    public : WNavigationBar *navigationBar = nullptr;
    public : WContainerWidget *mainContainer = nullptr;

    public : WindowIntro *windowIntro = nullptr;

    public : WPushButton *logInOutPushButton = nullptr;
    public : WindowImageEdit *windowImageEdit = nullptr;
    private: bool _logInOutState;

    public : void _showIntroContent()
    {
        for(auto child : mainContainer->children())
        {
            child->hide();
            delete child;
        }
        windowIntro = new WindowIntro(mainContainer);
    }
    void _showLogInPushButton()
    {
        logInOutPushButton->setIcon(WLink("icons/Navigation/Log-In.png"));
        logInOutPushButton->setText("Log in");
    }

    public :void _showLogOutPushButton()
    {
        logInOutPushButton->setIcon(WLink("icons/Navigation/Log-Out.png"));
        logInOutPushButton->setText("Log out");
    }

    MainWindow(WContainerWidget *parent) : WContainerWidget(parent)
    {
        navigationBar = new WNavigationBar(this);
        navigationBar->setResponsive(true);

        mainContainer = new WContainerWidget(this);

        logInOutPushButton = new WPushButton("Log in", this);
        logInOutPushButton->clicked().connect(std::bind([=](){
            if(_logInOutState)
            {
                LogInForm *logInForm = new LogInForm(this);
                logInForm->show();
                logInForm->finished().connect(std::bind([=](WDialog::DialogCode code){
                    if(code == WDialog::Accepted)
                    {
                        _logInOutState = false;
                        _showLogOutPushButton();
                        for(auto child : mainContainer->children())
                        {
                            child->hide();
                            delete child;
                        }
                        DatabaseManagerWt::instance()->prepareDatabaseModel(this);
                    }
                    delete logInForm;
                },std::placeholders::_1));
            }
            else
            {
                if(WMessageBox::show(
                            "Warning",
                            "Do you really want to log out?",
                            Yes | No) == Yes)
                {
                    _logInOutState = true;
                    AuthManager::instance()->logOutCurrentUser();
                    _showLogInPushButton();
                    _showIntroContent();
                }
            }
        }));
        _logInOutState = true;
        _showLogInPushButton();
        navigationBar->addWidget(logInOutPushButton, AlignRight);

        windowIntro = new WindowIntro(mainContainer);

        navigationBar->setMargin(0,Bottom);
    }
};
}
}


#endif // MAINNWINDOW

