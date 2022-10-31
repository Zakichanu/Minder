import {
  Route,
  Routes,
  useLocation,
  useNavigationType,
} from "react-router-dom";

import Dashboard from "./pages/Dashboard";
import Homepage from "./pages/HomePage";
import LoginSC from "./pages/LoginSC";
import SignupSC from "./pages/SignupSC";
import { useEffect } from "react";

function App() {
  const action = useNavigationType();
  const location = useLocation();
  const pathname = location.pathname;

  useEffect(() => {
    if (action !== "POP") {
      window.scrollTo(0, 0);
    }
  }, [action]);

  useEffect(() => {
    let title = "Minder";
    let metaDescription = "Faites du sport près de chez vous";

    //TODO: Update meta titles and descriptions below
    switch (pathname) {
      case "/":
        title = "Minder - Accueil";
        metaDescription = "Vitrine";
        break;

      case "/SignupSC":
        title = "Espace centre sportif - Inscription";
        metaDescription = "Inscription";
        break;

      case "/LoginSC":
        title = "Espace centre sportif - Connexion";
        metaDescription = "Connexion";
        break;
      case "/Dashboard":
        title = "Espace centre sportif - Tableau de bord";
        metaDescription = "Tableau de bord";
        break;
    }

    if (title) {
      document.title = title;
    }

    if (metaDescription) {
      const metaDescriptionTag: HTMLMetaElement | null = document.querySelector(
        'head > meta[name="description"]'
      );
      if (metaDescriptionTag) {
        metaDescriptionTag.content = metaDescription;
      }
    }
  }, [pathname]);

  return (
    <Routes>
      <Route path="/" element={<Homepage />} />

      <Route path="/SignupSC" element={<SignupSC />} />

      <Route path="/LoginSC" element={<LoginSC />} />
      
      <Route path="/Dashboard" element={<Dashboard />} />
    </Routes>
  );
}
export default App;
