<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Festivio"

    const descriptionMap = {
    0: "Event music agency",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/festivio/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
