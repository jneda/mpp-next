import SetImageIcon from "./Icon/SetImageIcon";
import SetColorIcon from "./Icon/SetColorIcon";
import SetFontIcon from "./Icon/SetFontIcon";

import styles from "./Toolbar.module.css";

export default function Toolbar(props) {
  return (
    <menu className={styles.menu}>
      <SetImageIcon
        className={styles.icon}
        name="setImage"
        clickhandler={props.onModeChange}
      />
      <SetColorIcon
        className={styles.icon}
        name="setColor"
        clickhandler={props.onModeChange}
      />
      <SetFontIcon
        className={styles.icon}
        name="setFont"
        clickhandler={props.onModeChange}
      />
    </menu>
  );
}
