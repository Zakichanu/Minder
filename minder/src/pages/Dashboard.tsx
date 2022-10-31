import { FunctionComponent, useEffect } from "react";

import NavBar from "../components/NavBar";
import styles from "./Dashboard.module.css";

const Dashboard: FunctionComponent = () => {
  useEffect(() => {
    const scrollAnimElements = document.querySelectorAll(
      "[data-animate-on-scroll]"
    );
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting || entry.intersectionRatio > 0) {
            const targetElement = entry.target;
            targetElement.classList.add(styles.animate);
            observer.unobserve(targetElement);
          }
        }
      },
      {
        threshold: 0.15,
      }
    );

    for (let i = 0; i < scrollAnimElements.length; i++) {
      observer.observe(scrollAnimElements[i]);
    }

    return () => {
      for (let i = 0; i < scrollAnimElements.length; i++) {
        observer.unobserve(scrollAnimElements[i]);
      }
    };
  }, []);

  return (
    
    <div className={styles.signupSCDiv}>
      <NavBar />
      <div className={styles.ScrollPage}>

        
            <div className={styles.rectangleContent}>
            </div>

            <div className={styles.rectangleContent}>
            </div>

            <div className={styles.rectangleContent}>
            </div><div className={styles.rectangleContent}>
            </div><div className={styles.rectangleContent}>
            </div><div className={styles.rectangleContent}>
            </div>
            
            <div className={styles.rectangleAjout}>
            </div>
            
      </div>

    </div>

  );
};

export default Dashboard;
