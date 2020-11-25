#define DEBUG_VIEW

using UnityEngine;
using System.Collections;

public class ReporterGUI : MonoBehaviour
{
	Reporter reporter;
	void Awake()
	{
		reporter = gameObject.GetComponent<Reporter>();
	}

	void OnGUI()
	{
#if DEBUG_VIEW
        reporter.OnGUIDraw();
#endif
    }
}
