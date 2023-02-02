import RoundSlider from "../RoundSlider";
import Navbar from "../Navbar/Navbar";

import "./Homepage.css";

export default function App() {
  let path = "backgrounds/bg01.jpg";
  return (
    <>
      <div
        className="background"
        style={{
          backgroundImage: `url(${path})`
        }}
      ></div>
      <RoundSlider />
      <Navbar />
    </>
  );
}
