﻿using Google.Cloud.Firestore;

namespace Svendeproeve_KlatreApp_API.FirebaseDocuments
{
    [FirestoreData]
    public class ExerciseDocument
    {
        [FirestoreProperty]
        public string Name { get; set; }

        [FirestoreProperty]
        public string Description { get; set; }

        [FirestoreProperty]
        public string Asset_Location { get; set; }

        [FirestoreProperty]
        public string Howto_Location { get; set; }

        [FirestoreProperty]
        public string Musclegroup_Location { get; set; }

        [FirestoreProperty]
        public string Benefits { get; set; }

        [FirestoreProperty]
        public string Overall_Target { get; set; }

        [FirestoreProperty]
        public int Reps { get; set; }

        [FirestoreProperty]
        public int Sets { get; set; }

        [FirestoreProperty]
        public List<string> Included_In { get; set; }

        [FirestoreProperty]
        public List<string> Primary_Activation { get; set; }

        [FirestoreProperty]
        public List<string> Secondary_Activation { get; set; }

    }
}
