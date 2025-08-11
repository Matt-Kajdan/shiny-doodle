<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Globetrotter"

    const descriptionMap = {
    0: "Holiday planning service & destination browser",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/globetrotter/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
